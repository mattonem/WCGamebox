Class {
	#name : 'GBMouseOverDetection',
	#superclass : 'GBElement',
	#instVars : [
		'currentlyOvering'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBMouseOverDetection >> addedTo: aNode [

	super addedTo: aNode.
	aNode announcer
		when: GBMouseMove
		do: [ :ev |
			(self contains: ev position)
				ifTrue: [
					currentlyOvering ifFalse: [
						currentlyOvering := true.
						aNode announcer announce:
							(GBMouseOverStarted new with: ev position) ] ]
				ifFalse: [
					currentlyOvering ifTrue: [
						currentlyOvering := false.
						aNode announcer announce:
							(GBMouseOverEnded new with: ev position) ] ] ]
		for: self
]

{ #category : 'accessing' }
GBMouseOverDetection >> contains: aPoint [
	self subclassResponsibility
]

{ #category : 'accessing' }
GBMouseOverDetection >> initialize [

	super initialize.

]
