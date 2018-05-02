using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zombiespwaning: MonoBehaviour 
{
	public GameObject  target; //the enemy's target

	[SerializeField]

	private float moveSpeedZombie = 200; //move speed
	var rotationSpeed = 50; //speed of turning

	var myTransform : Transform; // transform data of this enemy

	function Awake()
	{
		myTransform = transform; //cache data for easy access
	}

	function Start()
	{
		target = GameObject.FindWithTag("Player").transform; //target the player

	}

	function Update () {
		//rotate to look at the player
		myTransform.rotation = Zombie.Slerp(myTransform.rotation,
			Quaternion.LookRotation(target.position - myTransform.position), rotationSpeed*Time.deltaTime);

		//move towards the player
		myTransform.position += myTransform.forward * moveSpeed * Time.deltaTime;

	}





}
