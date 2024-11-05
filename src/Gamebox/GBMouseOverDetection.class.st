Class {
	#name : 'GBMouseOverDetection',
	#superclass : 'GBElement',
	#instVars : [
		'currentlyOvering',
		'eventStarted',
		'eventEnded'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBMouseOverDetection >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBMouseGlobalMove
		do: [ :ev |
			(self contains: ev position)
				ifTrue: [
					currentlyOvering ifFalse: [
						currentlyOvering := true.
						aNode announcer announce: (eventStarted with: ev position) ] ]
				ifFalse: [
					currentlyOvering ifTrue: [
						currentlyOvering := false.
						aNode announcer announce: (eventEnded with: ev position) ] ] ]
		for: self
]

{ #category : 'accessing' }
GBMouseOverDetection >> contains: aPoint [
	self subclassResponsibility
]

{ #category : 'accessing' }
GBMouseOverDetection >> initialize [

	super initialize.
	eventStarted := GBMouseOverStarted new.
	eventEnded := GBMouseOverEnded new
]
