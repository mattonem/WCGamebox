Class {
	#name : 'GBCollision',
	#superclass : 'GBElement',
	#instVars : [
		'lookfor',
		'points',
		'doBlock'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBCollision >> addedTo: aNode [

	aNode announcer
		when: GBCollisionDetection
		do: [ :evt |
			aNode announcer announce: (GBCollisionLookup new
					 points: points copy;
					 caller: self;
					 yourself) ]
		for: self
]

{ #category : 'accessing' }
GBCollision >> collideWith: anElement [

	doBlock value: anElement
]

{ #category : 'accessing' }
GBCollision >> do: aBlock [

	doBlock := aBlock
]

{ #category : 'accessing' }
GBCollision >> lookfor [
	^ lookfor
]

{ #category : 'accessing' }
GBCollision >> lookfor: anObject [

	lookfor := anObject
]

{ #category : 'accessing' }
GBCollision >> points: anObject [

	points := anObject
]
