Class {
	#name : 'GBPolygon',
	#superclass : 'GBDrawable',
	#traits : 'GBTPolygon',
	#classTraits : 'GBTPolygon classTrait',
	#instVars : [
		'color'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBPolygon >> color [

	^ color
]

{ #category : 'accessing' }
GBPolygon >> color: anObject [

	color := anObject
]

{ #category : 'drawing' }
GBPolygon >> drawOn: ctx [

	ctx
		fillStyle: color;
		beginPath;
		moveTo: points first x and: points first y.
	points allButFirst do: [ :aPoint |
		ctx lineTo: aPoint x and: aPoint y ].
	ctx
	   moveTo: points first x and: points first y;
		closePath;
		fill
]

{ #category : 'drawing' }
GBPolygon >> initialize [ 
	super initialize.
	self initializeGBTPolygon.
	color := 'red'
]
