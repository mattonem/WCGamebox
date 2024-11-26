Class {
	#name : 'GBDrawingTranslation',
	#superclass : 'GBReference',
	#instVars : [
		'position'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBDrawingTranslation >> initialize [

	super initialize.
	position := 0 @ 0.
]

{ #category : 'accessing' }
GBDrawingTranslation >> moveContext: ctx [

		ctx translate: position x and: position y.
]

{ #category : 'accessing' }
GBDrawingTranslation >> movePoint: oldPos [

	^  oldPos - position.
]

{ #category : 'accessing' }
GBDrawingTranslation >> movePointUp: oldPos [

	^  oldPos + position.
]

{ #category : 'as yet unclassified' }
GBDrawingTranslation >> position [

	^ position
]

{ #category : 'as yet unclassified' }
GBDrawingTranslation >> position: anObject [

	position := anObject
]
