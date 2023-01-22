/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex_utils_bonus.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: scornhol <scornhol@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/07 19:31:04 by scornhol          #+#    #+#             */
/*   Updated: 2022/02/12 19:04:33 by scornhol         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "pipex_bonus.h"

void	put_perror(const char *message, int err_code)
{
	if (err_code)
		perror(message);
	else
		ft_putendl_fd((char *)message, STDERR_FILENO);
	exit(EXIT_FAILURE);
}

void	execute_cmd(char *command, char **envp)
{
	char	**paths;
	char	**cmd_args;
	char	*cmd;
	int		i;

	paths = get_paths(envp);
	cmd_args = ft_split(command, ' ');
	if (!cmd_args)
		put_perror("\033[31mError: failed to split the command.", ERR);
	cmd = get_command(paths, cmd_args[0]);
	if (!cmd)
		put_perror("\033[31mError: command not found.", ERR);
	i = -1;
	while (paths[++i])
		free(paths[i]);
	free(paths);
	if (execve(cmd, cmd_args, envp) == -1)
		put_perror("\033[31mError: failed to execute the command.", ERR);
	free(cmd);
	i = -1;
	while (cmd_args[++i])
		free(cmd_args[i]);
	free(cmd_args);
}

char	**get_paths(char **envp)
{
	char	**paths;
	int		i;

	paths = NULL;
	i = 0;
	while (envp[i])
	{
		if (ft_strnstr(envp[i], "PATH=", ft_strlen(envp[i])))
		{
			paths = ft_split(envp[i] + ft_strlen("PATH="), ':');
			break ;
		}
		++i;
	}
	if (!envp[i])
		put_perror("\033[31mError: path in env is not found.", ERR_NULL);
	if (!paths)
		put_perror("\033[31mError: failed to split the paths.", ERR);
	return (paths);
}

char	*get_command(char **paths, char *cmd)
{
	char	*command;
	char	*tmp;

	if (ft_strchr(cmd, '/'))
	{
		command = ft_strdup(cmd);
		if (!command)
			put_perror("\033[31mError: failed to copyy the path.", ERR);
		if (!access(command, X_OK))
			return (command);
	}
	while (*paths)
	{
		tmp = ft_strjoin(*paths, "/");
		command = ft_strjoin(tmp, cmd);
		if (!(tmp && command))
			put_perror("\033[31mError: failed to join the path.", ERR);
		free(tmp);
		if (!access(command, X_OK))
			return (command);
		free(command);
		++paths;
	}
	return (NULL);
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
	else if (mode == F_APPEND)
	{
		fd = open(pathname, O_CREAT | O_WRONLY | O_APPEND, 0777);
		if (fd < 0)
			put_perror("\033[31mError: failed to open output file.", ERR);
		return (fd);
	}
	put_perror("\033[31mError: wrong file opening mode.", ERR_NULL);
	exit(EXIT_FAILURE);
}
