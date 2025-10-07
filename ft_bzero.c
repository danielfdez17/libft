/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_bzero.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: danfern3 <danfern3@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 07:46:20 by danfern3          #+#    #+#             */
/*   Updated: 2025/10/03 10:00:10 by danfern3         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>

void	ft_bzero(void *s, size_t n)
{
	char	*ptr;
	size_t	i;

	i = 0;
	ptr = (char *)s;
	while (i < n)
	{
		ptr[i] = '\0';
		++i;
	}
}

// #include <strings.h>
// #include <stdio.h>
// int main(void)
// {
// 	char *str = "Hello World!";
// 	size_t n = 3;
// 	printf("str: %s\n", (char *)str);
// 	printf("bytes: %zu\n", n);
// 	bzero(str, n);
// 	printf("bzero: %s\n", (char *)str);
// 	// char *str2 = "Hola mundo!";
// 	// ft_bzero(str2, n);
// 	// printf("ft_bzero: %s\n", str2);
// 	return (0);
// }