Class {
	#name : 'GBReferenceAnimation',
	#superclass : 'GBElement',
	#instVars : [
		'nextPosition',
		'nextAngle',
		'nextScale'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBReferenceAnimation >> _calculateNextPosition: aReference with: ev [

	nextPosition := aReference position.
	nextAngle := aReference angle.
	nextScale := aReference scale.
	self calculateNextPosition: aReference with: ev
]

{ #category : 'as yet unclassified' }
GBReferenceAnimation >> addedTo: aReference [

	aReference announcer
		when: GBCalculate
		do: [ :ev | self _calculateNextPosition: aReference with: ev ]
		for: self.
	aReference announcer
		when: GBUpdate
		do: [
			aReference
				position: self nextPosition;
				angle: self nextAngle;
				scale: self nextScale ]
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

{ #category : 'as yet unclassified' }
GBReferenceAnimation >> nextScale [

	^ nextScale
]
