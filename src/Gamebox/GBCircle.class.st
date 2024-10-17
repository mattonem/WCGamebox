Class {
	#name : 'GBCircle',
	#superclass : 'GBDrawable',
	#instVars : [
		'radius',
		'color'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBCircle >> color [

	^ color
]

{ #category : 'accessing' }
GBCircle >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
GBCircle >> drawOn: aCanvas [
	self shouldBeImplemented 
]

{ #category : 'accessing' }
GBCircle >> radius [

	^ radius
]

{ #category : 'accessing' }
GBCircle >> radius: anObject [

	radius := anObject
]
