#include <stdio.h>
#include <wait.h>
#include <unistd.h>

/**
 * infinite_while - runs an infinite while loop
 * Return: Always 0
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Create 5 zombie process
 * Return: Always 0
 */

int main(void)
{
	int pid, i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid == 0)
			return (0);
		printf("Zombie process created, PID: %d\n", pid);
	}
	infinite_while();
	return (0);
}
