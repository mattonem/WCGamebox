Class {
	#name : 'GBReferenceAnnimation',
	#superclass : 'GBElement',
	#instVars : [
		'nextPosition',
		'nextAngle'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'as yet unclassified' }
GBReferenceAnnimation >> addedTo: aReference [
	
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
GBReferenceAnnimation >> calculateNextPosition: aReference with: ev [ 
	self subclassResponsibility
]

{ #category : 'accessing' }
GBReferenceAnnimation >> nextAngle [

	^ nextAngle
]

{ #category : 'accessing' }
GBReferenceAnnimation >> nextPosition [

	^ nextPosition
]
