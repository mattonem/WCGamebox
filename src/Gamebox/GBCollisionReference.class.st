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
		when: GBCollisionLookdown
		do: [ :evt |
			(evt caller lookfor = identifier and: [
				 evt points anySatisfy: [ :aPt | shape contains: aPt ] ]) ifTrue: [
				evt caller collideWith: self ] ]
		for: self.
	announcer := aNode announcer
]

{ #category : 'accessing' }
GBCollisionReference >> announcer [
	^ announcer
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
