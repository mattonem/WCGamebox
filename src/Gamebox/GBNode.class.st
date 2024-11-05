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
GBNode >> addAllElements: aColl [

	aColl do: [ :e | self addElement: e ]
]

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
GBNode >> deleteAllChildren [

	| oldChildren |
	oldChildren := children.
	children := OrderedCollection new.
	oldChildren do: [ :aChild |
		aChild deleteFrom: self.
		announcer announce: (GBChildRemoved new child: aChild) ]
]

{ #category : 'adding' }
GBNode >> forwardEvent [ 
	^ GBAnnouncement - GBTick - GBDrawSequenceStart 
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
GBNode >> rotation: anAngle [

	| ref |
	self addElement: (ref := GBDrawingRotation new
			        angle: anAngle;
			        yourself).
	^ ref
]

{ #category : 'adding' }
GBNode >> scaleRef: aPoint [

	| ref |
	self addElement: (ref := GBDrawingScale new
			        scale: aPoint;
			        yourself).
	^ ref
]

{ #category : 'adding' }
GBNode >> translation: aPoint [

	| ref |
	self addElement: (ref := GBDrawingTranslation new
			        position: aPoint;
			        yourself).
	^ ref
]

{ #category : 'adding' }
GBNode >> triggerElementFirst: anElement [
	"If anElement contains/is UI elements, this will make it appear behind all other UI elements in the node."
	announcer bringFirst: anElement
]

{ #category : 'adding' }
GBNode >> triggerElementLast: anElement [
	"If anElement contains/is UI elements, this will make it appear in front of all other UI elements in the node."
	announcer bringLast: anElement
]
