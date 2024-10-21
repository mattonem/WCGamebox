Class {
	#name : 'GBReferenceAnimation',
	#superclass : 'GBElement',
	#instVars : [
		'nextPosition',
		'nextAngle'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBReferenceAnimation >> addedTo: aReference [
	
	aReference announcer
		when: GBCalculate
		do: [ :ev | self calculateNextPosition: aReference with: ev  ]
		for: self.
	aReference announcer
		when: GBUpdate
		do: [
			aReference position: self nextPosition.
			aReference angle: self nextAngle ]
		for: self
]

{ #category : 'accessing' }
GBReferenceAnimation >> calculateNextPosition: aReference with: ev [ 
	self subclassResponsibility
]

{ #category : 'accessing' }
GBReferenceAnimation >> nextAngle [

	^ nextAngle
]

{ #category : 'accessing' }
GBReferenceAnimation >> nextPosition [

	^ nextPosition
]
