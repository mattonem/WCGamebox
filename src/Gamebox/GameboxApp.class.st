Class {
	#name : 'GameboxApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#instVars : [
		'clock',
		'debug'
	],
	#classInstVars : [
		'staticComponents'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'description' }
GameboxApp class >> appClasses [

	<pharoJsSkip>
	^ super appClasses , { WCGameBoxCanvas }
]

{ #category : 'description' }
GameboxApp class >> bridgeClientClass [
	<pharoJsSkip>
	
	^ PjZnHostedBrowserBridgeClient
]

{ #category : 'description' }
GameboxApp class >> exporterClass [
	<pharoJsSkip>
	
	^ PjFileExporterWithIndexHtml
]

{ #category : 'description' }
GameboxApp class >> generateHtmlUsing: html [

	<pharoJsSkip>
	html div
		class: 'container';
		with: [
			html div
				class: 'card col-10 mx-auto text-center';
				with: [
					html div
						class: 'card-header';
						with: [
							html heading
								level: 1;
								with: 'GameBox' ].
					html div
						class: 'card-body';
						with: [
							html div with: [
									self addComponent: (WCGameBoxCanvas on: html) named: #plotter ].
							html div with: [
									html label
										for: 'tps';
										class: 'form-label';
										with: 'TPS: '.
									html inputRange
										min: 1;
										max: 240;
										value: 120;
										class: 'form-range';
										id: 'tps' ].
							html div with: [
								html label
									for: 'timeFactor';
									class: 'form-label';
									with: 'TimeSpeed: '.
								html inputRange
									min: 1;
									max: 1000;
									value: 100;
									class: 'form-range';
									id: 'timeFactor' ].
							html div
								id: #start;
								class: 'btn btn-primary';
								with: 'Start Animation'.
							html div
								id: #stop;
								class: 'btn btn-primary';
								with: 'Stop Animation'.
							html div
								id: #addShape;
								class: 'btn btn-primary';
								with: 'Add shape' ] ] ]
]

{ #category : 'description' }
GameboxApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]

{ #category : 'initialize-release' }
GameboxApp >> addShapeTo: aScene [

	| el |
	aScene addElement: (el := self polygonFactory position:
			       (0 to: 1000) atRandom @ (0 to: 1000) atRandom).
	aScene triggerElementLast: debug
]

{ #category : 'as yet unclassified' }
GameboxApp >> polygonFactory [

	| ref |
	ref := GBDrawingReference new position: 100 @ 100; scale: 2@2.
	ref
		addElement: (GBPolygon new
				 color: self randomColor ;
				 points: {
						 (20 @ 0).
						 (10 @ (20 * (3 sqrt / 2))).
						 (-10 @ (20 * (3 sqrt / 2))).
						 (-20 @ 0).
						 (-10 @ (20 * (0 - 3 sqrt / 2))).
						 (10 @ (20 * (0 - 3 sqrt / 2))) };
				 yourself);
		addElement: (GBRotationAnimation new speed: -3);
		addElement: (GBSinusScale new).

	^ ref
]

{ #category : 'as yet unclassified' }
GameboxApp >> randomColor [

	| value r g b |
	value := (0 to: 255) atRandom.
	r := (value asInteger toString: 16) padStart: 2 with: '0'.
	value := (0 to: 255) atRandom.
	g := (value asInteger toString: 16) padStart: 2 with: '0'.
	value := (0 to: 255) atRandom.
	b := (value asInteger toString: 16) padStart: 2 with: '0'.
	^ '#' , r , g , b
]

{ #category : 'as yet unclassified' }
GameboxApp >> sceneFactory [

	| node ref2 img orchestrator drawEvent animation ref |
	drawEvent := GBDrawSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.
	animation := GBRotationAnimation new.
	orchestrator := GBOchestrator new
		                sequence: {
				                GBCalculate new.
				                GBUpdate new.
				                drawEvent };
		                yourself.

	clock := GBClock new.
	clock requestedTps: 120.
	img := GBImage new
		       url: 'https://www.svgrepo.com/show/219787/camping-tent.svg';
		       yourself.
	node := GBNode new.
	ref2 := GBDrawingReference new
		        name: 'center';
		        position: -400 @ -400;
		        yourself.
	ref := GBDrawingReference new
		       name: 'Image';
		       position: 500 @ 500;
		       yourself.

	ref addElement: ref2.
	ref2 addElement: img.
	ref addElement: animation.
	node addElement: ref.
	node addElement: clock.
	node addElement: orchestrator.
	node addElement: GBDrawSequencer new.
	node addElement: self polygonFactory.
	node addElement: (debug := GBDebugger new).



	^ node
]

{ #category : 'initialize-release' }
GameboxApp >> start [

	super start.

	self initializeComponentHolder.

	(self componentNamed: #plotter) scene: self sceneFactory.
	(document getElementById: #start)
		addEventListener: #click
		block: [ clock start ].
	(document getElementById: #stop)
		addEventListener: #click
		block: [ clock stop ].
	(document getElementById: #tps)
		addEventListener: #input
		block: [ clock requestedTps: (document getElementById: #tps) value ].
	(document getElementById: #timeFactor)
		addEventListener: #input
		block: [
			clock timeFactor:
				(document getElementById: #timeFactor) value asInteger / 100 ].
	(document getElementById: #addShape)
		addEventListener: #click
		block: [ self addShapeTo: (self componentNamed: #plotter) scene ]
]
