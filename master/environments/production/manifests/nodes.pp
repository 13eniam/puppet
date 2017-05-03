#Put node specific configurations here

node 'agent1.fireeye.com' {
	notify { "Running in ${environment}. Include node specific files here.":
	}
}
node 'agent2.fireeye.com' {
	notify { "Running in ${environment}. Include node specific files here.":
	}
}
node 'agent3.fireeye.com' {
	notify { "Running in ${environment}. Include node specific files here.":
	}
}
