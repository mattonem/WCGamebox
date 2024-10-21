Class {
	#name : 'GameboxApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#instVars : [
		'clock'
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
							self addComponent: (WCGameBoxCanvas on: html) named: #plotter.
							html div
								id: #start;
								class: 'btn btn-primary';
								with: 'start'.
							html div
								id: #stop;
								class: 'btn btn-primary';
								with: 'stop' ] ] ]
]

{ #category : 'description' }
GameboxApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]

{ #category : 'as yet unclassified' }
GameboxApp >> circleFab [

	| node ref2 img orchestrator drawEvent animation |
	drawEvent := GBDrawSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.
	animation := GBRotationAnnimation new.
	orchestrator := GBOchestrator new
		                sequence: {
				                GBCalculate new.
				                GBUpdate new.
				                drawEvent };
		                yourself.

	clock := GBClock new.
	img := GBImage new
		       url: 'https://www.svgrepo.com/show/404920/camping.svg';
		       yourself.
	node := GBNode new.

	ref2 := GBDrawingReference new
		        name: 'Circle';
		        position: 200 @ 200;
		        angle: 10 degreesToRadians;
		        yourself.

	ref2 addElement: img.
	ref2 addElement: animation.
	node addElement: ref2.
	node addElement: clock.
	node addElement: orchestrator.
	node addElement: GBDrawSequencer new.

	^ node
]

{ #category : 'initialize-release' }
GameboxApp >> start [

	super start.

	self initializeComponentHolder.

	(self componentNamed: #plotter) scene: self circleFab.
	(document getElementById: #start)
		addEventListener: #click
		block: [ clock start ].
	(document getElementById: #stop)
		addEventListener: #click
		block: [ clock stop ]
]
