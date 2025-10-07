/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putendl_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: danfern3 <danfern3@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 07:46:08 by danfern3          #+#    #+#             */
/*   Updated: 2025/10/03 12:21:58 by danfern3         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include "libft.h"

// static void	ft_putchar_fd(char c, int fd)
// {
// 	write(fd, &c, 1);
// }

// static void	ft_putstr_fd(char const *s, int fd)
// {
// 	if (!s)
// 		return ;
// 	while (*s)
// 	{
// 		ft_putchar_fd(*s, fd);
// 		s++;
// 	}
// }

void	ft_putendl_fd(char const *s, int fd)
{
	if (!s)
		return ;
	ft_putstr_fd(s, fd);
	ft_putchar_fd('\n', fd);
}
