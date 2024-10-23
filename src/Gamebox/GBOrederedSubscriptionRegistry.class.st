Class {
	#name : 'GBOrederedSubscriptionRegistry',
	#superclass : 'SubscriptionRegistry',
	#category : 'Gamebox-Subscription',
	#package : 'Gamebox',
	#tag : 'Subscription'
}

{ #category : 'initialization' }
GBOrederedSubscriptionRegistry >> bringFirst: subscriber [

	^ self protected: [ | toRemove |
		toRemove := subscriptions select: [ :subscription | subscription subscriber == subscriber ].
		toRemove do: [ :e | e unregister ].
		subscriptions removeAll: toRemove.
		subscriptions addAllFirst: toRemove.
		 ]
]

{ #category : 'initialization' }
GBOrederedSubscriptionRegistry >> bringLast: subscriber [

	^ self protected: [ | toRemove |
		toRemove := subscriptions select: [ :subscription | subscription subscriber == subscriber ].
		toRemove do: [ :e | e unregister ].
		subscriptions removeAll: toRemove.
		subscriptions addAll: toRemove.
		 ]
]

{ #category : 'initialization' }
GBOrederedSubscriptionRegistry >> reset [
	"subscriber -> subscriptions"

	subscriptions := OrderedCollection new
]
