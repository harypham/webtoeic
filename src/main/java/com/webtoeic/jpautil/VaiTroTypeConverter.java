package com.webtoeic.jpautil;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import com.webtoeic.entities.VaiTro;

@Converter
public class VaiTroTypeConverter implements AttributeConverter<VaiTro, Integer> {

	@Override
	public Integer convertToDatabaseColumn(VaiTro vaiTro) {
		return vaiTro.getValue();
	}

	@Override
	public VaiTro convertToEntityAttribute(Integer value) {
		for (VaiTro type : VaiTro.values()) {
			if (type.getValue() == value) {
				return type;
			}
		}
		throw new IllegalArgumentException(" Illegal tagType value exception.");
	}
}
