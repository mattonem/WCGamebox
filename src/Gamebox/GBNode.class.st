Class {
	#name : 'GBNode',
	#superclass : 'GBElement',
	#instVars : [
		'children',
		'announcer'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBNode >> addElement: anObject [ 
	children add: anObject.
	anObject addedTo: self.
	announcer announce: (GBChildAdded new child: anObject)
]

{ #category : 'adding' }
GBNode >> addedTo: aNode [

	aNode announcer
		when: self forwardEvent
		do: [ :ev | announcer announce: ev ]
		for: self.
	
]

{ #category : 'initialization' }
GBNode >> announcer [
	^ announcer
]

{ #category : 'initialization' }
GBNode >> children [
	^ children 
]

{ #category : 'adding' }
GBNode >> forwardEvent [ 
	^ GBAnnouncement - GBTick - GBClear
]

{ #category : 'adding' }
GBNode >> initialize [

	super initialize.
	children := OrderedCollection new.
	announcer := GBOrederedAnnouncer new.

]

{ #category : 'initialization' }
GBNode >> removeElement: anElement [
	children remove: anElement.
	anElement deleteFrom: self.
	announcer announce: (GBChildRemoved new child: anElement)
]

{ #category : 'adding' }
GBNode >> triggerElementFirst: anElement [
	announcer bringFirst: anElement
]

{ #category : 'adding' }
GBNode >> triggerElementLast: anElement [
	"If anElement contains/is UI elements, this will make it appear in front of all other UI elements in the node."
	announcer bringLast: anElement
]
