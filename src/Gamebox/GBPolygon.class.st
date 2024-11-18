Class {
	#name : 'GBPolygon',
	#superclass : 'GBDrawable',
	#traits : 'GBTPolygon',
	#classTraits : 'GBTPolygon classTrait',
	#instVars : [
		'color',
		'lineWidth',
		'strokeStyle'
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
		beginPath;
		lineWidth: lineWidth;
		fillStyle: color;
		strokeStyle: strokeStyle;
		moveTo: points first x and: points first y.
	points allButFirst do: [ :aPoint |
		ctx lineTo: aPoint x and: aPoint y ].
	ctx
		moveTo: points first x and: points first y;
		closePath.
	color ifNotNil: [ ctx fill ].
	strokeStyle ifNotNil: [ ctx stroke ]
]

{ #category : 'drawing' }
GBPolygon >> initialize [

	super initialize.
	self initializeGBTPolygon.
	color := 'red'.
]

{ #category : 'accessing' }
GBPolygon >> lineWidth: anObject [

	lineWidth := anObject
]

{ #category : 'accessing' }
GBPolygon >> strokeStyle: anObject [

	strokeStyle := anObject
]
