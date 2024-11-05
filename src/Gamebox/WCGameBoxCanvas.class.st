Class {
	#name : 'WCGameBoxCanvas',
	#superclass : 'WCComponent',
	#instVars : [
		'scene'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'rendering' }
WCGameBoxCanvas >> canvasHeight [

	^ (self getElementById: #plot) height
]

{ #category : 'rendering' }
WCGameBoxCanvas >> canvasWidth [

	^ (self getElementById: #plot) width
]

{ #category : 'rendering' }
WCGameBoxCanvas >> clear [

	self context
		clearRect: 0
		y: 0
		w: self canvasWidth
		h: self canvasHeight
]

{ #category : 'rendering' }
WCGameBoxCanvas >> context [

	^ (self getElementById: #plot) getContext: '2d'
]

{ #category : 'rendering' }
WCGameBoxCanvas >> getBoundingClientRect [
	^ (self getElementById: #plot) getBoundingClientRect
]

{ #category : 'rendering' }
WCGameBoxCanvas >> height [
	^ (self getElementById: #plot) getAttribute: #height 
]

{ #category : 'rendering' }
WCGameBoxCanvas >> onMouseClickDo: aBlock [

	(self getElementById: #plot)
		addEventListener: #click
		block: [ :e |
			| rect pos |
			rect := self getBoundingClientRect.
			pos := e clientX - rect left @ (e clientY - rect top).
			pos := (pos x * self width / rect width)  
			       @ (pos y * self height / rect height).
			pos := pos asIntegerPoint + (1 @ 1).
			aBlock cull: pos]
]

{ #category : 'rendering' }
WCGameBoxCanvas >> onMouseMoveDo: aBlock [

	(self getElementById: #plot)
		addEventListener: #mousemove
		block: [ :e |
			| rect pos |
			rect := self getBoundingClientRect.
			pos := e clientX - rect left @ (e clientY - rect top).
			pos := (pos x * self width / rect width)  
			       @ (pos y * self height / rect height).
			pos := pos asIntegerPoint + (1 @ 1).
			aBlock cull: pos ]
]

{ #category : 'rendering' }
WCGameBoxCanvas >> renderHtmlOn: html [

	html canvas
		id: 'plot';
		width: 1000;
		height: 1000;
		class: 'mx-auto';
		style: 'width: 400px; height:400px; user-select: none;'
]

{ #category : 'accessing' }
WCGameBoxCanvas >> scene [

	^ scene
]

{ #category : 'accessing' }
WCGameBoxCanvas >> scene: anObject [

	scene := anObject
]

{ #category : 'rendering' }
WCGameBoxCanvas >> start [

	super start.
]

{ #category : 'accessing' }
WCGameBoxCanvas >> update [

	scene announcer announce: (GBFullDrawingNow new
			 context: self context;
			 yourself)
]

{ #category : 'rendering' }
WCGameBoxCanvas >> width [
	^ (self getElementById: #plot) getAttribute: #width 
]
