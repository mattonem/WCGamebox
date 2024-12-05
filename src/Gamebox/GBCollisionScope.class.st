Class {
	#name : 'GBCollisionScope',
	#superclass : 'GBNode',
	#instVars : [
		'colliders'
	],
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBCollisionScope >> initialize [

	super initialize.
	colliders := Dictionary new.
	announcer
		when: GBTransformationLookup
		do: [ :evt |
			| reference |
			reference := evt target.
			(colliders at: reference identifier ifAbsentPut: [ Dictionary new ])
				at: reference
				put: {
						(#reference -> reference).
						(#transformation -> evt transformation) } asDictionary ]
		for: self.
	announcer
		when: GBCollisionLookup
		do: [ :evt |
			| collision |
			collision := evt caller.
			colliders
				at: collision lookfor
				ifPresent: [ :someColliders |
					someColliders do: [ :aReferenceAndTransformation |
						| points |
						points := evt points collect: [ :aPoint |
							          (aReferenceAndTransformation at: #transformation)
								          value: aPoint ].

						(aReferenceAndTransformation at: #reference) announcer
							announce: (GBHandleCollision new
									 points: points;
									 caller: collision) ] ]
				ifAbsent: [  ] ]
		for: self.
	announcer
		when: GBTransformationToBeRemoved
		do: [ :evt |
			| reference |
			reference := evt target.
			(colliders at: reference identifier) removeKey: reference hash ]
		for: self
]

{ #category : 'adding' }
GBCollisionScope >> upwardEvent [

	^ super upwardEvent - GBCollisionLookup - GBTransformationLookup 
]
