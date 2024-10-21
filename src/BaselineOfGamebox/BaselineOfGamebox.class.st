Class {
	#name : 'BaselineOfGamebox',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGamebox',
	#package : 'BaselineOfGamebox'
}

{ #category : 'baselines' }
BaselineOfGamebox >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			baseline: 'Camping'
			with: [ spec repository: 'github://mattonem/WildCamping:master' ].

		spec package: #Gamebox with: [ spec requires: #( Camping ) ] ]
]
