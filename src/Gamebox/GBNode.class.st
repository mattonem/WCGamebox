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
	announcer announce: (ChildAdded new child: anObject)
]

{ #category : 'initialization' }
GBNode >> children [
	^ children 
]

{ #category : 'initialization' }
GBNode >> initialize [

	super initialize.
	children := OrderedCollection new
]
