Class {
	#name : 'GBCollisionLookup',
	#superclass : 'GBAnnouncementUp',
	#instVars : [
		'points',
		'caller'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBCollisionLookup >> caller [

	^ caller
]

{ #category : 'accessing' }
GBCollisionLookup >> caller: anObject [

	caller := anObject
]

{ #category : 'accessing' }
GBCollisionLookup >> initialize [ 
	super initialize. 
]

{ #category : 'accessing' }
GBCollisionLookup >> points [

	^ points  
]

{ #category : 'accessing' }
GBCollisionLookup >> points: anObject [

	points := anObject 
]
