Class {
	#name : 'GameboxDummyTestApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
	#instVars : [
		'root',
		'reference'
	],
	#classInstVars : [
		'staticComponents'
	],
	#category : 'Gamebox-Tests',
	#package : 'Gamebox-Tests'
}

{ #category : 'description' }
GameboxDummyTestApp class >> appClasses [

	<pharoJsSkip>
	^ super appClasses , { WCGameBoxCanvas }
]

{ #category : 'description' }
GameboxDummyTestApp class >> bridgeClientClass [
	<pharoJsSkip>
	
	^ PjZnHostedBrowserBridgeClient
]

{ #category : 'description' }
GameboxDummyTestApp class >> exporterClass [
	<pharoJsSkip>
	
	^ PjFileExporterWithIndexHtml
]

{ #category : 'description' }
GameboxDummyTestApp class >> generateHtmlUsing: html [

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
								with: 'Collision check' ].
					html div
						class: 'card-body';
						with: [
							html div with: [
									self addComponent: (WCGameBoxCanvas on: html) named: #plotter ] ] ] ]
]

{ #category : 'description' }
GameboxDummyTestApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]

{ #category : 'as yet unclassified' }
GameboxDummyTestApp >> prepBoard [

	| shareRef poly |
	(shareRef := (root translation: 500 @ 500) rotation: 1) addElement:
		(poly := GBPolygon new
			         points: self shape;
			         color: nil;
			         strokeStyle: 'black';
			         lineWidth: 5;
			         yourself).
	shareRef addElement: (GBRotationAnimation new speed: -0.5).
	shareRef addElement: (GBCollisionReference new
			 identifier: #shape;
			 shape: poly).
	(1 to: 20) do: [ :i |
		(1 to: 20) do: [ :j |
			| circle circleRef |
			(circleRef := root translation: i * 15 @ (j * 15) + (350 @ 350))
				addElement: (circle := GBCircle new radius: 4).
			circleRef addElement: (GBScript new
					 on: GBUpdate;
					 do: [ circle color: 'red' ]).
			circleRef addElement: (GBCollision new
					 points: { (0 @ 0) };
					 lookfor: #shape;
					 do: [ :aCollider | circle color: 'green' ];
					 yourself) ] ]
]

{ #category : 'as yet unclassified' }
GameboxDummyTestApp >> randomColor [

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
GameboxDummyTestApp >> sceneFactory [

	| drawEvent orchestrator clock |
	drawEvent := GBDrawFullClearSequenceStart new
		             context: (self componentNamed: #plotter) context;
		             yourself.
	orchestrator := GBOchestrator new
		                sequence: {
				                GBCalculate new.
				                GBUpdate new.
			                   GBCollisionDetection new.
				                drawEvent };
		                yourself.

	root := GBCollisionScope new.
	clock := GBClock new.
	clock requestedTps: 120.
	clock waitUntilIsFinished: orchestrator.
	root addElement: clock.
	root addElement: orchestrator.
	root addElement: (reference := GBDrawingTranslation new
			              position: 500 @ 500;
			              yourself).

	root addElement: GBDrawSequencer new.
	root addElement: (GBCaptureMouseClick new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	root addElement: (GBCaptureMouseMove new
			 onCanvas: (self componentNamed: #plotter);
			 yourself).
	self prepBoard.
	root addElement: (GBScript new
			 on: GBMouseGlobalClick;
			 do: [ root announcer announce: drawEvent ];
			 yourself).
	root addElement: (GBScript new
			 on: GBMouseGlobalMove;
			 do: [ root announcer announce: drawEvent ];
			 yourself).

	root addElement: GBDebugger new.
	clock start.
	^ root
]

{ #category : 'as yet unclassified' }
GameboxDummyTestApp >> shape [
	^ {
		  (73 @ 53).
		  (16 @ 50).
		  (-37 @ 115).
		  (-92 @ 67).
		  (-120 @ 1).
		  (-104 @ -75).
		  (-25 @ -77).
		  (30 @ -95).
		  (50 @ -37).
		  (94 @ 0) }
]

{ #category : 'initialize-release' }
GameboxDummyTestApp >> start [

	| scene |
	super start.
	self initializeComponentHolder.
	(self componentNamed: #plotter) scene: (scene := self sceneFactory).
	
]
