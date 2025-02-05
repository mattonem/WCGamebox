Class {
	#name : 'WCGameBoxCanvas',
	#superclass : 'WCComponent',
	#instVars : [
		'scene',
		'width',
		'height',
		'widthStyle',
		'heightStyle'
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
	^ height ifNil: [ height := 400 ]
]

{ #category : 'rendering' }
WCGameBoxCanvas >> height: someSize [
	height := someSize 
]

{ #category : 'rendering' }
WCGameBoxCanvas >> heightStyle [

	^ heightStyle ifNil: [ height asString , 'px' ]
]

{ #category : 'accessing' }
WCGameBoxCanvas >> heightStyle: anObject [

	heightStyle := anObject
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
		width: self width;
		height: self height;
		class: 'mx-auto';
		style: 'width:' , self widthStyle , '; height:' , self heightStyle
			, '; user-select: none;';
		attributeAt: 'tabindex' put: '1'
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
	^ width ifNil: [ width := 400 ]
]

{ #category : 'rendering' }
WCGameBoxCanvas >> width: someSize [
	width := someSize 
]

{ #category : 'rendering' }
WCGameBoxCanvas >> widthStyle [

	^ widthStyle ifNil: [ width asString , 'px' ]
]

{ #category : 'accessing' }
WCGameBoxCanvas >> widthStyle: anObject [

	widthStyle := anObject
]
