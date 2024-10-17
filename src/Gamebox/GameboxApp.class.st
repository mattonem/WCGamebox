Class {
	#name : 'GameboxApp',
	#superclass : 'PjFileBasedWebApp',
	#traits : 'StaticComponentHolder',
	#classTraits : 'StaticComponentHolder classTrait',
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
GameboxApp class >> circleFab [

	| circle ref node circle2 ref2 |
	circle := GBCircle new.
	circle2 := GBCircle new.
	node := GBNode new.
	ref := GBDrawingReference new
		       name: 'Circle';
		       position: 100 @ 100;
		       angle: 180 degreesToRadians;
		       yourself.
	ref2 := GBDrawingReference new
		        name: 'Circle';
		        position: 100 @ 100;
		        angle: 0 degreesToRadians;
		        yourself.
	ref2 addElement: circle2.
	ref addElement: circle.
	node addElement: ref.
	node addElement: ref2.
	^ node
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
							self addComponent: (WCGameBoxCanvas on: html) named: #plotter ] ] ]
]

{ #category : 'description' }
GameboxApp class >> updateHtmlRoot: root [

	<pharoJsSkip>
	root language: 'en'.
	root stylesheet url:
		'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'
]

{ #category : 'initialize-release' }
GameboxApp >> start [

	super start.

	self initializeComponentHolder.

	(self componentNamed: #plotter)
		scene: self class circleFab;
		update
]
