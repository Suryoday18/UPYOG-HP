import { compose } from "recompose";
import { Button } from "components";
import { withRouter } from "react-router-dom";
import React, { Component } from "react";
import { connect } from "react-redux";
import Label from "egov-ui-kit/utils/translationNode";
import HistoryCard from "../../../../../Property/components/HistoryCard";
import { getFormattedDate } from "../../../../../../../utils/PTCommon";
import { getFullRow } from "../AssessmentHistory";

class PaymentHistory extends Component {
    constructor(props) {
        super(props);
        this.state = {
            items: [],
            showItems: false,
        };
    }
    getBillPeriod(billDetails = []) {
        let latest = billDetails.sort((x, y) => y.fromPeriod - x.fromPeriod);
        const billPeriod = getFormattedDate(latest[latest.length - 1].fromPeriod) + ' to ' + getFormattedDate(latest[0].toPeriod);
        return billPeriod;

    }
    getTransformedPaymentHistory() {
        const labelStyle = {
            letterSpacing: 1.2,
            fontWeight: "600",
            lineHeight: "40px",
        };
        const buttonStyle = {
            float: 'right',
            lineHeight: "35px",
            height: "35px",
            backgroundColor: "rgb(242, 242, 242)",
            boxShadow: "none",
            border: "1px solid rgb(254, 122, 81)",
            borderRadius: "2px",
            outline: "none",
            alignItems: "right",
        };
        const { Payments = [] } = this.props;
        const paymentHistoryItems = Payments.map((payment, index) => {
            return (
                <div>
                    {getFullRow("PT_HISTORY_RECEIPT_NO", payment.paymentDetails[0].receiptNumber ? '' + payment.paymentDetails[0].receiptNumber : "NA", 12)}
                    {getFullRow("PT_HISTORY_AMOUNT_PAID", payment.totalAmountPaid ? 'Rs ' + payment.totalAmountPaid : "NA", 12)}
                    {getFullRow("PT_HISTORY_PAYMENT_DATE", payment.transactionDate ? getFormattedDate(payment.transactionDate) : "NA", 12)}
                    {getFullRow("PT_HISTORY_BILL_NO", payment.transactionNumber ? '' + payment.transactionNumber : "NA", 12)}
                    {getFullRow("PT_HISTORY_BILL_PERIOD", this.getBillPeriod(payment.paymentDetails[0].bill.billDetails), 6)}
                    <div className="col-sm-6 col-xs-12" style={{ marginBottom: 10, marginTop: 5 }}>
                        <div style={{ float: "right" }}>
                            <Button
                                label={<Label buttonLabel={true} label="PT_DOWNLOAD_RECEIPT" color="rgb(254, 122, 81)" fontSize="16px" height="40px" labelStyle={labelStyle} />}
                                buttonStyle={buttonStyle}
                                onClick={() => {
                                    // lastElement.onClick();
                                }}
                            ></Button>
                        </div>
                    </div >
                </div>)

        })
        return paymentHistoryItems;
    }

    render() {

        const { Payments = [] } = this.props;

        let paymentHistoryItem = [];
        if (Payments.length > 0) {
            paymentHistoryItem = this.getTransformedPaymentHistory();
        }
        const items = this.state.showItems ? this.state.items : [];
        return (<HistoryCard header={'PT_PAYMENT_HISTORY'} items={items} onHeaderClick={() => {
            console.log("clicked");
            this.setState({ showItems: !this.state.showItems, items: paymentHistoryItem })
        }}></HistoryCard>)
    }
}


const mapStateToProps = (state, ownProps) => {
    const { Bill = [], Payments = [] } = state.properties || {};
    const propertyId = decodeURIComponent(ownProps.match.params.propertyId);

    return {
        propertyId,
        Bill,
        Payments
    };
};




export default compose(
    withRouter,
    connect(
        mapStateToProps,
        null
    )
)(PaymentHistory);