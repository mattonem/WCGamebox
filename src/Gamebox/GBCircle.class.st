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
GBCircle >> drawOn: ctx [

	ctx beginPath.
	ctx
		arc: 0
		and: 0
		radius: radius
		and: 0
		and: 2 * Float pi.
	ctx fillStyle: color.

	ctx fill
]

{ #category : 'accessing' }
GBCircle >> initialize [

	super initialize.
	color := 'red'
]

{ #category : 'accessing' }
GBCircle >> radius [

	^ radius
]

{ #category : 'accessing' }
GBCircle >> radius: anObject [

	radius := anObject
]
