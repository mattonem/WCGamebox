Class {
	#name : 'GBCollisionReference',
	#superclass : 'GBElement',
	#instVars : [
		'identifier',
		'shape',
		'announcer'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBCollisionReference >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBHandleCollision
		do: [ :evt |
			(evt points anySatisfy: [ :aPt | shape contains: aPt ]) ifTrue: [
				evt caller collideWith: self ] ]
		for: self.
	announcer := aNode announcer.
	announcer announce: (GBTransformationLookup new target: self).
	aNode announcer
		when: GBWillBeRemoved
		do: [ :evt |
			aNode announcer announce: (GBTransformationToBeRemoved new
					 target: self;
					 yourself) ]
		for: self
]

{ #category : 'accessing' }
GBCollisionReference >> announcer [
	^ announcer
]

{ #category : 'as yet unclassified' }
GBCollisionReference >> deleteFrom: aNode [
	aNode announcer unsubscribe: self.
	console log: 'detele from:' 
]

{ #category : 'accessing' }
GBCollisionReference >> identifier [

	^ identifier
]

{ #category : 'accessing' }
GBCollisionReference >> identifier: anObject [

	identifier := anObject
]

{ #category : 'accessing' }
GBCollisionReference >> shape [

	^ shape
]

{ #category : 'accessing' }
GBCollisionReference >> shape: anObject [

	shape := anObject
]
