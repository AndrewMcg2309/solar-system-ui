using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController2 : MonoBehaviour 
{
	private CharacterController characterController;
	public GameObject bulletPrefab;
	public Transform bulletSpawn;

	[SerializeField]
	private float moveSpeed = 500;

	private void Awake()
	{
		characterController = GetComponent<CharacterController> ();
	}

	private void Update ()
	{
		var horizontal = Input.GetAxis ("Horizontal");
		var vertical = Input.GetAxis ("Vertical");

		var movement = new Vector3 (horizontal, 0, vertical);

		characterController.SimpleMove(movement * Time.deltaTime * moveSpeed);

		if (Input.GetKeyDown(KeyCode.Space))
		{
			Fire();
		}
	}


	void Fire()
	{
		// create the bullet
		var bullet = (GameObject)Instantiate(
			bulletPrefab,
			bulletSpawn.position,
			bulletSpawn.rotation);

		// velocity to bullets
		bullet.GetComponent<Rigidbody>().velocity = bullet.transform.forward * 4;

		// Destroy the bullet after 2 seconds
		Destroy(bullet, 2.0f);        
	}



}
