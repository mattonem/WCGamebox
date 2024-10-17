Class {
	#name : 'GBNode',
	#superclass : 'GBElement',
	#instVars : [
		'children'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBNode >> addElement: anObject [ 
	children add: anObject.
	anObject addedTo: self.
	announcer announce: (ChildAdded new child: anObject)
]

{ #category : 'initialization' }
GBNode >> children [
	^ children 
]

{ #category : 'adding' }
GBNode >> forwardEvent [ 
	^ GBAnnouncement 
]

{ #category : 'adding' }
GBNode >> initialize [

	super initialize.
	children := OrderedCollection new.
	announcer
		when: self forwardEvent
		do: [ :evt | children do: [ :c | c announcer announce: evt ] ]
		for: self
]
