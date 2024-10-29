"
A GBTCircleTest is a test class for testing the behavior of GBTCircle
"
Class {
	#name : 'GBTCircleTest',
	#superclass : 'TestCase',
	#category : 'Gamebox-Tests',
	#package : 'Gamebox-Tests'
}

{ #category : 'tests' }
GBTCircleTest >> testContains [

	| poly |
	poly := GBMouseOverCircle new r: 10.
	self assert: (poly contains: 3 @ 3) equals: true.
	self assert: (poly contains: 100 @ 100) equals: false.


]
