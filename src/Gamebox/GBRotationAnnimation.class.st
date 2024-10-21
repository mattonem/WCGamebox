Class {
	#name : 'GBRotationAnnimation',
	#superclass : 'GBReferenceAnnimation',
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBRotationAnnimation >> calculateNextPosition: aReference with: ev [

	nextPosition := aReference position.
	nextAngle := (aReference deg + (ev duration * 1)) degreesToRadians.
]
