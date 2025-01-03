package com.ark.center.iam.infra.api.handler;

import com.ark.center.iam.client.contants.ApiAuthType;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//@MappedTypes(ApiAuthType.class)
public class ApiAuthTypeHandler extends BaseTypeHandler<ApiAuthType> {
    
    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, ApiAuthType parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.name());
    }

    @Override
    public ApiAuthType getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String value = rs.getString(columnName);
        return value == null ? null : ApiAuthType.valueOf(value);
    }

    @Override
    public ApiAuthType getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String value = rs.getString(columnIndex);
        return value == null ? null : ApiAuthType.valueOf(value);
    }

    @Override
    public ApiAuthType getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String value = cs.getString(columnIndex);
        return value == null ? null : ApiAuthType.valueOf(value);
    }
}