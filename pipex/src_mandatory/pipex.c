/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: scornhol <scornhol@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/07 19:12:34 by scornhol          #+#    #+#             */
/*   Updated: 2022/02/07 19:12:34 by scornhol         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex.h"

int	main(int argc, char **argv, char **envp)
{
	if (argc == 5)
		start_pipex(argv, envp);
	else if (argc > 5)
		put_perror("\033[31mError: Argument list too long.", ERR_NULL);
	else
		put_perror("\033[31mError: Argument list too short.", ERR_NULL);
	return (0);
}

void	start_pipex(char **argv, char **envp)
{
	int	fd_pipe[2];
	int	pid;

	if (pipe(fd_pipe) == -1)
		put_perror("\033[31mError: pipe cannot create descriptor pair.", ERR);
	pid = fork();
	if (pid == -1)
		put_perror("\033[31mError: fork cannot create a new process.", ERR);
	if (!pid)
		child_process(argv, envp, fd_pipe);
	waitpid(pid, NULL, 0);
	parent_process(argv, envp, fd_pipe);
	close(fd_pipe[0]);
	close(fd_pipe[1]);
}

void	child_process(char **argv, char **envp, int *fd_pipe)
{
	int	file_input;

	file_input = open_file(argv[1], F_READ);
	if (file_input < 0)
		put_perror("\033[31mError: failed to open input file.", ERR);
	dup2(fd_pipe[1], STDOUT_FILENO);
	dup2(file_input, STDIN_FILENO);
	close(fd_pipe[0]);
	execute_cmd(argv[2], envp);
}

void	parent_process(char **argv, char **envp, int *fd_pipe)
{
	int	file_output;

	file_output = open_file(argv[4], F_WRITE);
	if (file_output < 0)
		put_perror("\033[31mError: failed to open output file.", ERR);
	dup2(fd_pipe[0], STDIN_FILENO);
	dup2(file_output, STDOUT_FILENO);
	close(fd_pipe[1]);
	execute_cmd(argv[3], envp);
}

int	open_file(const char *pathname, int mode)
{
	int	fd;

	if (mode == F_READ)
	{
		fd = open(pathname, O_RDONLY);
		if (fd < 0)
			put_perror("\033[31mError: failed to open input file.", ERR);
		return (fd);
	}
	else if (mode == F_WRITE)
	{
		fd = open(pathname, O_CREAT | O_WRONLY | O_TRUNC, 0777);
		if (fd < 0)
			put_perror("\033[31mError: failed to open output file.", ERR);
		return (fd);
	}
	put_perror("\033[31mError: wrong file opening mode.", ERR_NULL);
	exit(EXIT_FAILURE);
}
