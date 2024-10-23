Class {
	#name : 'GBScript',
	#superclass : 'GBElement',
	#instVars : [
		'event',
		'block'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'convenience' }
GBScript class >> on: anEvent do: aBlock [

	^ self new
		  on: anEvent;
		  do: aBlock;
		  yourself
]

{ #category : 'instance creation' }
GBScript >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer when: event do: block for: self
]

{ #category : 'instance creation' }
GBScript >> do: ablock [
	block := ablock.
]

{ #category : 'instance creation' }
GBScript >> on: anEventClass [
	event := anEventClass.
]
