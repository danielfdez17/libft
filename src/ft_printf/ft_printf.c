/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: danfern3 <danfern3@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/10 09:34:48 by danfern3          #+#    #+#             */
/*   Updated: 2025/10/21 14:32:42 by danfern3         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_cases(char const *av, va_list ap)
{
	if (*av == 'c')
		return (ft_put_char(va_arg(ap, int)));
	if (*av == 's')
		return (ft_put_str(va_arg(ap, char *)));
	if (*av == 'p' || *av == 'x' || *av == 'X')
		return (ft_put_hex(va_arg(ap, unsigned long), *av));
	if (*av == 'd' || *av == 'i')
		return (ft_put_int(va_arg(ap, int)));
	if (*av == 'u')
		return (ft_put_uint(va_arg(ap, unsigned int)));
	if (*av == '%')
		return (ft_put_char('%'));
	ft_put_char('%');
	return (-1);
}

int	ft_printf(char const *av, ...)
{
	va_list	ap;
	int		ret;
	int		tmp;

	ret = 0;
	if (!av)
		return (-1);
	va_start(ap, av);
	while (*av)
	{
		if (*av == '%')
		{
			av++;
			tmp = ft_cases(av, ap);
			if (tmp == -1)
			{
				av--;
				tmp = 1;
			}
			ret += tmp;
		}
		else
			ret += ft_put_char(*av);
		av++;
	}
	va_end(ap);
	return (ret);
}
