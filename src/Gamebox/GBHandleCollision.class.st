Class {
	#name : 'GBHandleCollision',
	#superclass : 'Announcement',
	#instVars : [
		'points',
		'caller'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBHandleCollision >> caller [

	^ caller
]

{ #category : 'accessing' }
GBHandleCollision >> caller: anObject [

	caller := anObject
]

{ #category : 'accessing' }
GBHandleCollision >> points [

	^ points
]

{ #category : 'accessing' }
GBHandleCollision >> points: anObject [

	points := anObject
]
