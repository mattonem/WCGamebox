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

	ctx fillStyle: 'red'.
	ctx
		fillRect: 0
		and: 0
		and: 80
		and: 80
]

{ #category : 'accessing' }
GBCircle >> radius [

	^ radius
]

{ #category : 'accessing' }
GBCircle >> radius: anObject [

	radius := anObject
]
