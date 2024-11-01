Class {
	#name : 'GBRectangle',
	#superclass : 'GBDrawable',
	#traits : 'GBTRectangle',
	#classTraits : 'GBTRectangle classTrait',
	#instVars : [
		'color'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBRectangle >> color [

	^ color
]

{ #category : 'accessing' }
GBRectangle >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
GBRectangle >> drawOn: ctx [

	ctx fillStyle: color.
	ctx beginPath.
	ctx
		rect: 0
		and: 0
		to: corner x
		and: corner y;
		fill
]

{ #category : 'accessing' }
GBRectangle >> initialize [ 
	super initialize.
	self initializeGBTRectangle.
	color := 'red'
]
