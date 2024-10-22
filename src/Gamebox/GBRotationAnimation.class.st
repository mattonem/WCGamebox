Class {
	#name : 'GBRotationAnimation',
	#superclass : 'GBReferenceAnimation',
	#instVars : [
		'speed'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBRotationAnimation >> calculateNextPosition: aReference with: ev [

	nextAngle := (aReference deg + (ev duration * speed))
		             degreesToRadians.
]

{ #category : 'accessing' }
GBRotationAnimation >> initialize [ 
	super initialize.
	speed := 1.
]

{ #category : 'accessing' }
GBRotationAnimation >> speed [

	^ speed
]

{ #category : 'accessing' }
GBRotationAnimation >> speed: anObject [

	speed := anObject
]
