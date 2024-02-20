import React, { useState, useEffect } from 'react';
import axios from 'axios'

const ProfitLossDetails = ({ profitLossStatementId }) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const fetchData = async () => {
    try {
      const response = await axios.get(`/api/profit_loss_statements/${profitLossStatementId}/calculation`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      setData(response.data);
    } catch (error) {
      console.error('Error fetching data:', error);
      setError(error.message); // Store a user-friendly error message
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchData();
  }, [profitLossStatementId]);

  return (
    <div className="profit-loss-details">
      {loading ? (
        <p>Loading profit and loss data...</p>
      ) : error ? (
        <p className="error">Error: {error}</p>
      ) : (
        <table>
          <tbody>
            <tr>
              <th>Attribute</th>
              <th>Value</th>
            </tr>
            <tr>
              <td>Date</td>
              <td>{data?.date}</td>
            </tr>
            <tr>
              <td>Net Profit/Loss</td>
              <td>{data?.net_profit_loss}</td>
            </tr>
            <tr>
              <td>Revenue</td>
              <td>{data?.revenue}</td>
            </tr>
            <tr>
              <td>Expenses</td>
              <td>{data?.expenses}</td>
            </tr>
            <tr>
              <td>Sales</td>
              <td>{data?.sales}</td>
            </tr>
            <tr>
              <td>Accounts Receivable</td>
              <td>{data?.accounts_receivable}</td>
            </tr>
            <tr>
              <td>Accounts Payable</td>
              <td>{data?.accounts_payable}</td>
            </tr>
            {/* Add more rows for other attributes as needed */}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default ProfitLossDetails;
