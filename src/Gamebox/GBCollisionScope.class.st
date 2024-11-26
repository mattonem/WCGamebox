Class {
	#name : 'GBCollisionScope',
	#superclass : 'GBNode',
	#pools : [
		'PjDomGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'adding' }
GBCollisionScope >> initialize [ 
	super initialize. 
	announcer 
		when: GBCollisionLookup
		do: [ :evt |
			announcer announce: (GBCollisionLookdown new
					 points: evt points;
					 caller: evt caller;
					 yourself) ]
		for: self
]

{ #category : 'adding' }
GBCollisionScope >> upwardEvent [

	^ super upwardEvent - GBCollisionLookup
]
