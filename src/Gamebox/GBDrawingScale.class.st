Class {
	#name : 'GBDrawingScale',
	#superclass : 'GBReference',
	#instVars : [
		'scale'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBDrawingScale >> initialize [

	super initialize.
	scale := 1 @ 1.
]

{ #category : 'accessing' }
GBDrawingScale >> moveContext: ctx [

	ctx scale: scale x and: scale y.
]

{ #category : 'accessing' }
GBDrawingScale >> movePoint: oldPos [

	^ oldPos x / scale x @ (oldPos y / scale y)
]

{ #category : 'accessing' }
GBDrawingScale >> movePointUp: oldPos [

	^ oldPos x * scale x @ (oldPos y * scale y)
]

{ #category : 'as yet unclassified' }
GBDrawingScale >> scale [

	^ scale
]

{ #category : 'as yet unclassified' }
GBDrawingScale >> scale: anObject [

	scale := anObject
]

{ #category : 'accessing' }
GBDrawingScale >> transformationDownFor: aBlock [
	^ [ self movePoint: aBlock value ]
]
