/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex_bonus.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: scornhol <scornhol@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/07 19:30:39 by scornhol          #+#    #+#             */
/*   Updated: 2022/02/12 19:04:33 by scornhol         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

int	main(int argc, char **argv, char **envp)
{
	if (argc >= 5)
		start_pipex(argc, argv, envp);
	else
		put_perror("\033[31mError: Argument list too short.", ERR_NULL);
	return (0);
}

void	start_pipex(int argc, char **argv, char **envp)
{
	int	file_input;
	int	file_output;
	int	i;

	if (ft_strncmp(argv[1], "here_doc", ft_strlen("here_doc") + 1) == 0)
	{
		if (argc < 6)
			put_perror("\033[31mError: Bad argument list for here_doc.", 0);
		i = 3;
		file_output = open_file(argv[argc - 1], F_APPEND);
		here_doc(argv[2]);
	}
	else
	{
		i = 2;
		file_output = open_file(argv[argc - 1], F_WRITE);
		file_input = open_file(argv[1], F_READ);
		dup2(file_input, STDIN_FILENO);
	}
	while (i < argc - 2)
		child_process(argv[i++], envp);
	dup2(file_output, STDOUT_FILENO);
	execute_cmd(argv[argc - 2], envp);
}

char	*here_doc_auxiliary(char *limiter)
{
	char	*line;

	ft_putstr_fd("heredoc> ", STDOUT_FILENO);
	line = get_next_line(STDIN_FILENO);
	if (!line)
		put_perror("\033[31mError: cannot get new line.", ERR);
	if (ft_strncmp(line, limiter, ft_strlen(limiter)) == 0 \
				&& ft_strlen(limiter) + 1 == ft_strlen(line))
	{
		free(line);
		exit(EXIT_SUCCESS);
	}
	return (line);
}

void	here_doc(char *limiter)
{
	int		fd_pipe[2];
	int		pid;
	char	*line;

	if (pipe(fd_pipe) == -1)
		put_perror("\033[31mError: pipe cannot create descriptor pair.", ERR);
	pid = fork();
	if (pid == -1)
		put_perror("\033[31mError: fork cannot create a new process.", ERR);
	if (!pid)
	{
		close(fd_pipe[0]);
		while (1)
		{
			line = here_doc_auxiliary(limiter);
			ft_putstr_fd(line, fd_pipe[1]);
			free(line);
		}
	}
	else
	{
		close(fd_pipe[1]);
		dup2(fd_pipe[0], STDIN_FILENO);
		wait(NULL);
	}
}

void	child_process(char *argv, char **envp)
{
	int		fd_pipe[2];
	int		pid;

	if (pipe(fd_pipe) == -1)
		put_perror("\033[31mError: pipe cannot create descriptor pair.", ERR);
	pid = fork();
	if (pid == -1)
		put_perror("\033[31mError: fork cannot create a new process.", ERR);
	if (!pid)
	{
		close(fd_pipe[0]);
		dup2(fd_pipe[1], STDOUT_FILENO);
		execute_cmd(argv, envp);
	}
	else
	{
		close(fd_pipe[1]);
		dup2(fd_pipe[0], STDIN_FILENO);
		waitpid(pid, NULL, 0);
	}
}
