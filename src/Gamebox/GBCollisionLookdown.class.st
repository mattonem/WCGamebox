Class {
	#name : 'GBCollisionLookdown',
	#superclass : 'GBAnnouncementDown',
	#instVars : [
		'points',
		'caller'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBCollisionLookdown >> caller [

	^ caller
]

{ #category : 'accessing' }
GBCollisionLookdown >> caller: anObject [

	caller := anObject
]

{ #category : 'accessing' }
GBCollisionLookdown >> points [

	^ points
]

{ #category : 'accessing' }
GBCollisionLookdown >> points: anObject [

	points := anObject
]
