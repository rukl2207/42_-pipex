/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex_bonus.h                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: scornhol <scornhol@student.21-school.ru>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/07 19:30:53 by scornhol          #+#    #+#             */
/*   Updated: 2022/02/12 19:04:33 by scornhol         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PIPEX_BONUS_H
# define PIPEX_BONUS_H

# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/types.h>
# include <sys/stat.h>
# include <sys/wait.h>
# include <unistd.h>

# include "../src_ft/libft.h"

# define F_READ 0	// file open mode: 0 - opening a file for reading
# define F_WRITE 1	// file open mode: 1 - opening a file for writing
# define F_APPEND 2	// file open mode: 2 - opening a file for append
# define ERR_NULL 0	// errno not exists
# define ERR 1		// errno exists

void	start_pipex(int argc, char **argv, char **envp);
void	here_doc(char *limiter);
char	*here_doc_auxiliary(char *limiter);
void	child_process(char *argv, char **envp);
int		open_file(const char *pathname, int mode);
void	put_perror(const char *message, int err_code);
void	execute_cmd(char *argv, char **envp);
char	**get_paths(char **envp);
char	*get_command(char **paths, char *cmd);

#endif