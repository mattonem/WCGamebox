Class {
	#name : 'GBRotationAnimation',
	#superclass : 'GBReferenceAnimation',
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBRotationAnimation >> calculateNextPosition: aReference with: ev [

	nextPosition := aReference position.
	console log: ev duration.
	nextAngle := (aReference deg + (ev duration * 1)) degreesToRadians.
]
