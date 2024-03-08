package com.main.model;

import com.main.dto.AgentCollectionDto;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;


@SqlResultSetMapping(
        name = "AgentCollectionDtoMapping",
            classes = @ConstructorResult(
                    targetClass = AgentCollectionDto.class,
                    columns = {
                            @ColumnResult(name = "paymentDate", type = LocalDate.class),
                            @ColumnResult(name = "totalPayment", type = Long.class)
                    }
            )
//        entities = @EntityResult(
//                entityClass = AgentCollectionDto.class,
//                fields = {
//                        @FieldResult(name = "paymentDate",column = "paymentDate"),
//                        @FieldResult(name = "totalPayment",column = "totalPayment")
//                }
//        )
)

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "customer_payments")
public class CustomerPayments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String transactionId;
    private String customerId;
    private String userId;
    private int paymentAmount;
    private LocalDateTime transactionDate;
    private String customerStatusCode;
}
