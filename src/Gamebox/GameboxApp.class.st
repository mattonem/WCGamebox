Class {
	#name : 'GameboxApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#instVars : [
		'clock',
		'debug',
		'reference'
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
								with: 'Start Clock'.
							html div
								id: #stop;
								class: 'btn btn-primary';
								with: 'Stop Clock' ] ] ]
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
GameboxApp >> lightBlueBackground [

	| node |
	node := GBNode new.
	node addElement: (GBPolygon new
			 color: '#CCFFFF';
			 points: {
					 (0 @ 0).
					 (0 @ 1000).
					 (1000 @ 1000).
					 (1000 @ 0) }).
	^ node
]

{ #category : 'as yet unclassified' }
GameboxApp >> logoFactory [

	| node ref ref2 img |

	img := GBImage new
		       url: 'https://www.svgrepo.com/show/219787/camping-tent.svg';
		       yourself.
	node := GBNode new.
	ref2 := GBDrawingReference new
		        name: 'center';
		        position: -400 @ -400;
		        yourself.
	ref := GBDrawingReference new
		       name: 'scale';
		       yourself.
	ref2 addElement: img.
	ref addElement: ref2.
	node addElement: ref.
	ref addElement: (GBMouseOverCircle new r: 400).
	ref addElement: (GBMouseClickCircle new r: 400).
	ref addElement: (GBScript new
			 on: GBMouseOverStarted;
			 do: [ :e | ref scale: 1.1 @ 1.1 ]).
	ref addElement: (GBScript new
			 on: GBMouseOverEnded;
			 do: [ :e | ref scale: 1 @ 1 ]).
	ref addElement: (GBScript new
			 on: GBMouseElementClicked;
			 do: [ :e | self startPolygonScene ]).

	^ node
]

{ #category : 'as yet unclassified' }
GameboxApp >> octopusFactory [

	| ref ref2 |
	ref := GBDrawingReference new
		       scale: 0.2 @ 0.2;
		       position: 0 @ 0.
	ref2 := ref translation: 600 @ 0.
	(ref2 translation: -400 @ -400) addElement: (GBImage new
			 url: 'https://www.svgrepo.com/show/485003/octopus.svg';
			 yourself).
	ref addElement: (GBRotationAnimation new speed: -2).
	^ ref
]

{ #category : 'as yet unclassified' }
GameboxApp >> octopusNextScene [

	| ref poly |
	ref := GBDrawingReference new
		       position: 0 @ 0;
		       scale: 4 @ 4.
	ref
		addElement: (poly := GBPolygon new
				         color: 'blue';
				         points: {
						         (-10 @ -5).
						         (0 @ -5).
						         (0 @ -10).
						         (10 @ 0).
						         (0 @ 10).
						         (0 @ 5).
						         (-10 @ 5) };
				         yourself);
		addElement: (GBMouseOverPolygon new points: poly points);
		addElement: (GBMouseClickPolygon new points: poly points);
		addElement: (GBScript new
				 on: GBMouseOverStarted;
				 do: [ :ev | ref scale: 8@8 ]);
		addElement: (GBScript new
				 on: GBMouseOverEnded;
				 do: [ :ev | ref scale: 4@4 ]);
		addElement: (GBScript new
				 on: GBMouseElementClicked;
				 do: [ :ev | self startLogoScene ]).
	^ ref
]

{ #category : 'as yet unclassified' }
GameboxApp >> polygonFactory [

	| ref poly animation |
	ref := GBDrawingReference new
		       position: 0 @ 0;
		       scale: 4 @ 4.
	ref
		addElement: (poly := GBPolygon new
				         color: self randomColor;
				         points: {
						         (20 @ 0).
						         (10 @ (20 * (3 sqrt / 2))).
						         (-10 @ (20 * (3 sqrt / 2))).
						         (-20 @ 0).
						         (-10 @ (20 * (0 - 3 sqrt / 2))).
						         (10 @ (20 * (0 - 3 sqrt / 2))) };
				         yourself);
		addElement: (animation := GBRotationAnimation new speed: -3);
		addElement: (GBMouseOverPolygon new points: poly points);
		addElement: (GBMouseClickPolygon new points: poly points);
		addElement: (GBScript new
				 on: GBMouseOverStarted;
				 do: [ :ev | animation speed: 0 ]);
		addElement: (GBScript new
				 on: GBMouseOverEnded;
				 do: [ :ev | animation speed: -3 ]);
		addElement: (GBScript new
				 on: GBMouseElementClicked;
				 do: [ :ev |
					 | newShape |
					 reference addElement: (newShape := self polygonFactory
								              position:
									              (-500 to: 500) atRandom
									              @ (-500 to: 500) atRandom;
								              yourself).
					 reference triggerElementFirst: newShape ]).
	(ref translation: -15 @ 0) addElement: (GBText new
			 text: 'click me';
			 font: '10px serif').
	^ ref
]

{ #category : 'as yet unclassified' }
GameboxApp >> polygonNextScene [

	| ref poly |
	ref := GBDrawingReference new
		       position: 0 @ 0;
		       scale: 4 @ 4.
	ref
		addElement: (poly := GBPolygon new
				         color: 'blue';
				         points: {
						         (-10 @ -5).
						         (0 @ -5).
						         (0 @ -10).
						         (10 @ 0).
						         (0 @ 10).
						         (0 @ 5).
						         (-10 @ 5) };
				         yourself);
		addElement: (GBMouseOverPolygon new points: poly points);
		addElement: (GBMouseClickPolygon new points: poly points);
		addElement: (GBScript new
				 on: GBMouseOverStarted;
				 do: [ :ev | ref scale: 8@8 ]);
		addElement: (GBScript new
				 on: GBMouseOverEnded;
				 do: [ :ev | ref scale: 4@4 ]);
		addElement: (GBScript new
				 on: GBMouseElementClicked;
				 do: [ :ev | self startClip ]).
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

	| node orchestrator drawEvent bg |
	drawEvent := GBDrawSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.

	orchestrator := GBOchestrator new
		                sequence: {
				                GBCalculate new.
				                GBUpdate new.
				                drawEvent };
		                yourself.
	clock := GBClock new.
	clock requestedTps: 120.
	node := GBNode new.
	node addElement: (reference := GBDrawingReference new
			              position: 500 @ 500;
			              yourself).
	node addElement: clock.
	node addElement: orchestrator.
	node addElement: GBDrawSequencer new.
	node addElement: (debug := GBDebugger new).
	node addElement: (GBCaptureMouseClick new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	node addElement: (GBCaptureMouseMove new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	node addElement: (bg := self lightBlueBackground).
	node triggerElementFirst: bg.
	self startLogoScene.
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
	clock start
]

{ #category : 'as yet unclassified' }
GameboxApp >> startClip [

	| clip |
	reference deleteAllChildren.

	reference addElement: (clip := GBClipperCircle new
			         r: 100;
			         addElement: self octopusFactory).
	reference announcer
		when: GBMouseGlobalMove
		do: [ :e | clip center: e position ]
		for: clip.
	(reference translation: 300 @ 0) addElement: self octopusNextScene
]

{ #category : 'as yet unclassified' }
GameboxApp >> startLogoScene [

	reference deleteAllChildren.
	reference addElement: self logoFactory
]

{ #category : 'as yet unclassified' }
GameboxApp >> startPolygonScene [

	reference deleteAllChildren.
	reference addElement: self polygonFactory.
	(reference translation: 300 @ 0) addElement: self polygonNextScene
]
