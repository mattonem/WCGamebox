Class {
	#name : 'GBSinusScale',
	#superclass : 'GBReferenceAnimation',
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'Gamebox',
	#package : 'Gamebox'
}

{ #category : 'accessing' }
GBSinusScale >> calculateNextPosition: aReference with: ev [

	| factor |
	factor := (ev clock timeNow - ev clock startedAt / 100) cos + 1.5.
	nextScale :=  factor @ factor
]
