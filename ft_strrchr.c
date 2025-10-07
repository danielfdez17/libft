/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: danfern3 <danfern3@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 07:45:54 by danfern3          #+#    #+#             */
/*   Updated: 2025/10/06 10:54:37 by danfern3         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "libft.h"

// size_t	ft_strlen(const char *s)
// {
// 	size_t	i;

// 	i = 0;
// 	while (s[i])
// 		++i;
// 	return (i);
// }

char	*ft_strrchr(const char *s, int c)
{
	size_t	size;
	size_t	i;

	size = ft_strlen(s);
	i = size;
	while (i--)
		if (s[i] == (char)c)
			return ((char *)(s + i));
	if (c == '\0')
		return ((char *)(s + size));
	return (NULL);
}

// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <assert.h>
// int main(void)
// {
// 	// * 1
// 	const char *s = "bonjour";
// 	int c = 'b';
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 2
// 	c = 'o';
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 3
// 	s = "bonjourno";
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 4
// 	s = "bonjour";
// 	c = 'j';
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 5
// 	c = 's';
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 6
// 	c = '\0';
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 7
// 	s = "";
// 	assert(ft_strrchr(s, c) == strrchr(s, c));
// 	// * 8
// 	s = "bonjour";
// 	c = 'b';
// 	assert(ft_strrchr(s + 2, c) == strrchr(s + 2, c));
// 	// printf("ft_strrchr: %s\n", ft_strrchr(s, c));
// 	// printf("strrchr: %s\n---\n", strrchr(s, c));
// 	return (0);
// }